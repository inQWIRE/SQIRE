OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];

u1(0.000000) q[0];
h q[0];
u1(0.000000) q[0];
h q[1];
u1(0.000000) q[1];
u1(0.785398) q[0];
u1(0.785398) q[1];
cx q[0], q[1];
u1(-0.785398) q[1];
cx q[0], q[1];
h q[2];
u1(0.000000) q[2];
u1(0.785398) q[1];
u1(0.785398) q[2];
cx q[1], q[2];
u1(-0.785398) q[2];
cx q[1], q[2];
u1(0.392699) q[0];
u1(0.392699) q[2];
cx q[0], q[2];
u1(-0.392699) q[2];
cx q[0], q[2];
h q[3];
u1(0.000000) q[3];
u1(0.785398) q[2];
u1(0.785398) q[3];
cx q[2], q[3];
u1(-0.785398) q[3];
cx q[2], q[3];
u1(0.392699) q[1];
u1(0.392699) q[3];
cx q[1], q[3];
u1(-0.392699) q[3];
cx q[1], q[3];
u1(0.196350) q[0];
u1(0.196350) q[3];
cx q[0], q[3];
u1(-0.196350) q[3];
cx q[0], q[3];
h q[4];
u1(0.000000) q[4];
u1(0.785398) q[3];
u1(0.785398) q[4];
cx q[3], q[4];
u1(-0.785398) q[4];
cx q[3], q[4];
u1(0.392699) q[2];
u1(0.392699) q[4];
cx q[2], q[4];
u1(-0.392699) q[4];
cx q[2], q[4];
u1(0.196350) q[1];
u1(0.196350) q[4];
cx q[1], q[4];
u1(-0.196350) q[4];
cx q[1], q[4];
u1(0.098175) q[0];
u1(0.098175) q[4];
cx q[0], q[4];
u1(-0.098175) q[4];
cx q[0], q[4];
h q[5];
u1(0.000000) q[5];
u1(0.785398) q[4];
u1(0.785398) q[5];
cx q[4], q[5];
u1(-0.785398) q[5];
cx q[4], q[5];
u1(0.392699) q[3];
u1(0.392699) q[5];
cx q[3], q[5];
u1(-0.392699) q[5];
cx q[3], q[5];
u1(0.196350) q[2];
u1(0.196350) q[5];
cx q[2], q[5];
u1(-0.196350) q[5];
cx q[2], q[5];
u1(0.098175) q[1];
u1(0.098175) q[5];
cx q[1], q[5];
u1(-0.098175) q[5];
cx q[1], q[5];
u1(0.049087) q[0];
u1(0.049087) q[5];
cx q[0], q[5];
u1(-0.049087) q[5];
cx q[0], q[5];
h q[6];
u1(0.000000) q[6];
u1(0.785398) q[5];
u1(0.785398) q[6];
cx q[5], q[6];
u1(-0.785398) q[6];
cx q[5], q[6];
u1(0.392699) q[4];
u1(0.392699) q[6];
cx q[4], q[6];
u1(-0.392699) q[6];
cx q[4], q[6];
u1(0.196350) q[3];
u1(0.196350) q[6];
cx q[3], q[6];
u1(-0.196350) q[6];
cx q[3], q[6];
u1(0.098175) q[2];
u1(0.098175) q[6];
cx q[2], q[6];
u1(-0.098175) q[6];
cx q[2], q[6];
u1(0.049087) q[1];
u1(0.049087) q[6];
cx q[1], q[6];
u1(-0.049087) q[6];
cx q[1], q[6];
u1(0.024544) q[0];
u1(0.024544) q[6];
cx q[0], q[6];
u1(-0.024544) q[6];
cx q[0], q[6];
h q[7];
u1(0.000000) q[7];
u1(0.785398) q[6];
u1(0.785398) q[7];
cx q[6], q[7];
u1(-0.785398) q[7];
cx q[6], q[7];
u1(0.392699) q[5];
u1(0.392699) q[7];
cx q[5], q[7];
u1(-0.392699) q[7];
cx q[5], q[7];
u1(0.196350) q[4];
u1(0.196350) q[7];
cx q[4], q[7];
u1(-0.196350) q[7];
cx q[4], q[7];
u1(0.098175) q[3];
u1(0.098175) q[7];
cx q[3], q[7];
u1(-0.098175) q[7];
cx q[3], q[7];
u1(0.049087) q[2];
u1(0.049087) q[7];
cx q[2], q[7];
u1(-0.049087) q[7];
cx q[2], q[7];
u1(0.024544) q[1];
u1(0.024544) q[7];
cx q[1], q[7];
u1(-0.024544) q[7];
cx q[1], q[7];
u1(0.012272) q[0];
u1(0.012272) q[7];
cx q[0], q[7];
u1(-0.012272) q[7];
cx q[0], q[7];
u1(0.000000) q[7];
u1(0.000000) q[7];
u1(0.000000) q[7];
u1(0.024544) q[7];
u1(0.049087) q[6];
u1(0.098175) q[5];
u1(0.196350) q[4];
u1(0.392699) q[3];
u1(0.785398) q[2];
u1(1.570796) q[1];
u1(3.141593) q[0];
u1(0.000000) q[7];
u1(0.049087) q[7];
u1(0.098175) q[6];
u1(0.196350) q[5];
u1(0.392699) q[4];
u1(0.785398) q[3];
u1(1.570796) q[2];
u1(3.141593) q[1];
u1(0.000000) q[7];
u1(0.098175) q[7];
u1(0.196350) q[6];
u1(0.392699) q[5];
u1(0.785398) q[4];
u1(1.570796) q[3];
u1(3.141593) q[2];
u1(0.000000) q[7];
u1(0.196350) q[7];
u1(0.392699) q[6];
u1(0.785398) q[5];
u1(1.570796) q[4];
u1(3.141593) q[3];
u1(0.000000) q[3];
u1(0.000000) q[2];
u1(0.000000) q[1];
u1(0.000000) q[7];
u1(3.141593) q[7];
u1(0.000000) q[7];
cx q[0], q[7];
u1(0.012272) q[7];
cx q[0], q[7];
u1(-0.012272) q[7];
u1(-0.012272) q[0];
cx q[1], q[7];
u1(0.024544) q[7];
cx q[1], q[7];
u1(-0.024544) q[7];
u1(-0.024544) q[1];
cx q[2], q[7];
u1(0.049087) q[7];
cx q[2], q[7];
u1(-0.049087) q[7];
u1(-0.049087) q[2];
cx q[3], q[7];
u1(0.098175) q[7];
cx q[3], q[7];
u1(-0.098175) q[7];
u1(-0.098175) q[3];
cx q[4], q[7];
u1(0.196350) q[7];
cx q[4], q[7];
u1(-0.196350) q[7];
u1(-0.196350) q[4];
cx q[5], q[7];
u1(0.392699) q[7];
cx q[5], q[7];
u1(-0.392699) q[7];
u1(-0.392699) q[5];
cx q[6], q[7];
u1(0.785398) q[7];
cx q[6], q[7];
u1(-0.785398) q[7];
u1(-0.785398) q[6];
u1(0.000000) q[7];
h q[7];
cx q[0], q[6];
u1(0.024544) q[6];
cx q[0], q[6];
u1(-0.024544) q[6];
u1(-0.024544) q[0];
cx q[1], q[6];
u1(0.049087) q[6];
cx q[1], q[6];
u1(-0.049087) q[6];
u1(-0.049087) q[1];
cx q[2], q[6];
u1(0.098175) q[6];
cx q[2], q[6];
u1(-0.098175) q[6];
u1(-0.098175) q[2];
cx q[3], q[6];
u1(0.196350) q[6];
cx q[3], q[6];
u1(-0.196350) q[6];
u1(-0.196350) q[3];
cx q[4], q[6];
u1(0.392699) q[6];
cx q[4], q[6];
u1(-0.392699) q[6];
u1(-0.392699) q[4];
cx q[5], q[6];
u1(0.785398) q[6];
cx q[5], q[6];
u1(-0.785398) q[6];
u1(-0.785398) q[5];
u1(0.000000) q[6];
h q[6];
cx q[0], q[5];
u1(0.049087) q[5];
cx q[0], q[5];
u1(-0.049087) q[5];
u1(-0.049087) q[0];
cx q[1], q[5];
u1(0.098175) q[5];
cx q[1], q[5];
u1(-0.098175) q[5];
u1(-0.098175) q[1];
cx q[2], q[5];
u1(0.196350) q[5];
cx q[2], q[5];
u1(-0.196350) q[5];
u1(-0.196350) q[2];
cx q[3], q[5];
u1(0.392699) q[5];
cx q[3], q[5];
u1(-0.392699) q[5];
u1(-0.392699) q[3];
cx q[4], q[5];
u1(0.785398) q[5];
cx q[4], q[5];
u1(-0.785398) q[5];
u1(-0.785398) q[4];
u1(0.000000) q[5];
h q[5];
cx q[0], q[4];
u1(0.098175) q[4];
cx q[0], q[4];
u1(-0.098175) q[4];
u1(-0.098175) q[0];
cx q[1], q[4];
u1(0.196350) q[4];
cx q[1], q[4];
u1(-0.196350) q[4];
u1(-0.196350) q[1];
cx q[2], q[4];
u1(0.392699) q[4];
cx q[2], q[4];
u1(-0.392699) q[4];
u1(-0.392699) q[2];
cx q[3], q[4];
u1(0.785398) q[4];
cx q[3], q[4];
u1(-0.785398) q[4];
u1(-0.785398) q[3];
u1(0.000000) q[4];
h q[4];
cx q[0], q[3];
u1(0.196350) q[3];
cx q[0], q[3];
u1(-0.196350) q[3];
u1(-0.196350) q[0];
cx q[1], q[3];
u1(0.392699) q[3];
cx q[1], q[3];
u1(-0.392699) q[3];
u1(-0.392699) q[1];
cx q[2], q[3];
u1(0.785398) q[3];
cx q[2], q[3];
u1(-0.785398) q[3];
u1(-0.785398) q[2];
u1(0.000000) q[3];
h q[3];
cx q[0], q[2];
u1(0.392699) q[2];
cx q[0], q[2];
u1(-0.392699) q[2];
u1(-0.392699) q[0];
cx q[1], q[2];
u1(0.785398) q[2];
cx q[1], q[2];
u1(-0.785398) q[2];
u1(-0.785398) q[1];
u1(0.000000) q[2];
h q[2];
cx q[0], q[1];
u1(0.785398) q[1];
cx q[0], q[1];
u1(-0.785398) q[1];
u1(-0.785398) q[0];
u1(0.000000) q[1];
h q[1];
u1(0.000000) q[0];
h q[0];
u1(0.000000) q[7];

