Require Coq.extraction.Extraction.
Require Import AltGateSet.
Require Import Shor.
Require Import AltShor.

(* Standard utilities for bools, options, etc. *)
Require Coq.extraction.ExtrOcamlBasic.

(* A few common functions not included in ExtrOcamlBasic. *)
Extract Inlined Constant fst => "fst".
Extract Inlined Constant snd => "snd".
Extract Inlined Constant negb => "not".
Extract Inlined Constant length => "List.length".
Extract Inlined Constant app => "List.append".
Extract Inlined Constant rev => "List.rev".
Extract Inlined Constant rev_append => "List.rev_append".
Extract Inlined Constant List.map => "List.map".
Extract Inlined Constant fold_right => "(fun f a l -> List.fold_right f l a)".
Extract Inlined Constant forallb => "List.for_all".

(* Standard extraction from nat -> OCaml int. *)
Require Coq.extraction.ExtrOcamlNatInt.

(* Custom extraction from R -> OCaml float. *)
Extract Inlined Constant R => "float".
Extract Inlined Constant R0 => "0.0".
Extract Inlined Constant R1 => "1.0".
Extract Inlined Constant R2 => "2.0".
Extract Inlined Constant R4 => "4.0".
Extract Inlined Constant Rplus => "( +. )".
Extract Inlined Constant Rmult => "( *. )".
Extract Inlined Constant Ropp => "((-.) 0.0)".
Extract Inlined Constant Rinv => "((/.) 1.0)".
Extract Inlined Constant Rminus => "( -. )".
Extract Inlined Constant Rdiv => "( /. )".
Extract Inlined Constant pow => "(fun a b -> a ** Float.of_int b)".
Extract Inlined Constant cos => "cos".
Extract Inlined Constant sin => "sin".
Extract Inlined Constant tan => "tan".
Extract Inlined Constant atan => "atan".
Extract Inlined Constant acos => "acos".
Extract Inlined Constant PI => "Float.pi".
Extract Inlined Constant IZR => "Float.of_int".
(* Extracting the following to dummy values to supress warnings *)
Extract Constant ClassicalDedekindReals.sig_forall_dec  => "failwith ""Invalid extracted value"" ".
Extract Constant ClassicalDedekindReals.DRealRepr  => "failwith ""Invalid extracted value"" ".


(* Set "dim" to be implicit everywhere. *)
Extraction Implicit H [dim].
Extraction Implicit X [dim].
Extraction Implicit ID [dim].
Extraction Implicit SKIP [dim].
Extraction Implicit Rz [dim].
Extraction Implicit T [dim].
Extraction Implicit TDAG [dim].
Extraction Implicit CNOT [dim].
Extraction Implicit SWAP [dim].

(* special extraction for modular exponentiation so we don't run into 
   efficiency issues (this is a littele hacky -- it would be better to
   extract all operations to OCaml's Z type). -KH *)
Extract Constant modexp => "fun a x n -> Z.to_int (Z.powm (Z.of_int a) (Z.of_int x) (Z.of_int n))".

Definition shor_circuit a N := 
  let m := Nat.log2 (2 * N^2)%nat in
  let n := Nat.log2 (2 * N) in
  let numq := AltShor.num_qubits n in
  (AltShor.shor_circuit a N, (m + numq)%nat, m).

(* rewritten to use "modexp" *)
Fixpoint OF_post' (step a N o m : nat) :=
  match step with
  | O => O
  | S step' => let pre := OF_post' step' a N o m in
              if (pre =? O) then
                (if (modexp a (OF_post_step step' o m) N =? 1) 
                 then OF_post_step step' o m
                 else O)
              else pre
  end.
Definition OF_post a N o m := OF_post' (2 * m + 2) a N o m.

Definition post_process (a N o : nat) := 
  let m := Nat.log2 (2 * N^2)%nat in
  OF_post a N o m.

Separate Extraction shor_circuit post_process.

(** Final correctness property **)

(* Shor's algorithm:

1. Run the circuit generated by (shor_circuit a N) on input  ∣0⟩_{m + n + anc}.
2. Measure the first m qubits, resulting in the m-bit number x.
3. Run (post_process a N x) to obtain r, which is a candidate for the order (ord a N).

  The probability that post_process correctly returns (ord a N) is at least
  1/polylog(N), as shown in shor_OF_correct.

  TODO: There should probably be a 4th step that finds the factors of N... can we
  we verify this in Coq too? -KH 
*)

(* Tried to state the correctness property in a way that's easy to read...
   still needs improvement -KH *)

Definition probability_of_finding_r a N :=
  let m := Nat.log2 (2 * N^2)%nat in
  let r := ord a N in
  Rsum (2^m) (fun x => if (post_process a N x) =? r
                       then prob_shor_outputs a N x
                       else 0).

Lemma probability_of_finding_r_same : forall a N,
  (0 < N)%nat ->
  let m := Nat.log2 (2 * N^2)%nat in
  let n := Nat.log2 (2 * N)%nat in
  let r := ord a N in
  let anc := modmult_rev_anc n in
  let f := Shor.f_modmult_circuit a (modinv a N) N n in
  probability_of_finding_r a N = 
    probability_of_success_var a r N m n anc f.
Proof.
  intros a N H m n r anc f.
  unfold probability_of_finding_r, probability_of_success_var.
  subst m r.
  apply Rsum_eq. (* _bounded *)
  intro i.
  unfold r_found, post_process.
  replace Shor.OF_post with OF_post by reflexivity.
  bdestruct (OF_post a N i (Nat.log2 (2 * N ^ 2)) =? ord a N).
  rewrite Rmult_1_l.
  apply shor_circuit_same.
  assumption.
  rewrite Rmult_0_l.
  reflexivity.
Qed.

Lemma shor_OF_correct :
  exists β, 
    β>0 /\
    forall (a N : nat),
      (0 < a < N)%nat ->
      (Nat.gcd a N = 1)%nat ->
      probability_of_finding_r a N >= β / INR (Nat.log2 N)^4.
Proof.
  specialize Shor_correct_full_implementation as H.
  destruct H as [β [Hβ H]].
  exists β.
  split.
  apply Hβ.
  intros a N H1 H2.
  specialize (H a N H1 H2).
  rewrite probability_of_finding_r_same by lia.
  apply H.
Qed.

(* Double check that we're not using admitted lemmas *)
Print Assumptions shor_OF_correct.



 


