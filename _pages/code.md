---
layout: archive
title: "Code"
permalink: /code/
author_profile: true
---

## Scaled-Algencan

This is an adaptation of [Algencan](https://www.ime.usp.br/~egbirgin/tango/codes.php) 3.1.1, a safeguarded augmented Lagrangian solver written by E. Birgin and J.M. Martínez, which implements the additional option of scaling the final solution as described in

> [R. Andreani, G. Haeser, M.L. Schuverdt, L.D. Secchin, P.J.S. Silva. On scaled stopping criteria for a safeguarded augmented Lagrangian method with theoretical guarantees. Mathematical Programming Computation, 14:121-146, 2022](https://doi.org/10.1007/s12532-021-00207-9)

An easy way to incorporate the HSL and Metis packages is also implemented.

**URL:** <https://github.com/leonardosecchin/scaled-algencan>

## SimpleAL

This is a simple Julia implementation of the safeguarded augmented Lagrangian method for solving nonlinear programming problems, including those with complementarity constraints, described in

> [Andreani, Rosa, Secchin. On the boundedness of multipliers in augmented Lagrangian methods for mathematical programs with complementarity constraints (submitted). 2025](https://optimization-online.org/?p=31446)

**URL:** <https://github.com/leonardosecchin/SimpleAL>
