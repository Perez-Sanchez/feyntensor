# feyntensor

The aim of `feyntensor` is to perform integration for tensors of uniform index size (hypercube-arrays of same size in each
direction).  Denoting by $D$ the number of indices (writing $T_{a_1,\ldots,a_D}$ for the entries of $T$ and using a bar to denote complex conjugation) all ranging  from $1$ to some integer denoted by $N$,  `feyntensor` yields the value of

$$
\int_{\mathbb C^{N^{D} }} \notag 
\sum_{a_i,c_i,\ldots,u_i=1}^N & \Big(
T_{a_1,a_2,\ldots,a_D} \bar  T_{b_1,b_2,\ldots,b_D} \\  &\!\!\times
T_{c_1,c_2,\ldots,c_D}\bar  T_{d_1,d_2,\ldots,d_D}
\cdots
T_{u_1,u_2,\ldots,u_D}\bar  T_{v_1,v_2,\ldots,v_D} \Big)
 \mathrm{d}\mu_N  (T, \bar T) ,  \label{int}
$$

under the conditions that \begin{itemize}
                           \item
each one of the $D$ factors $\mathbb C^N$ transforms in the obvious way under and independently
under each of the $D$ independent  $U(N)$ factors  [the tensors have no (skew)symmetries], and

\item the integrand is a scalar. This requires some indices
to be repeated (whence the sum seems to list half of them, see details in Sec. \ref{background}).
                          \end{itemize}
Furthermore,
$\mathrm d \mu_N(T,\bar T)$, the Gaussian measure, is defined by %(here no sum intended)
$$ \label{propag} \frac 1N \int \bar T_{a_1,\ldots,a_D} T_{b_1,\ldots,b_D} \mathrm d \mu_N(T,\bar T)  = \frac 1{N^D} \prod_{i=1,\ldots,D} \delta_{a_i,b_i} .$$

