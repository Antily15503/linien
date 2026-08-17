# Cordic

## Arguments

-`module`: inherits migens `module` class.

- `width : int`: bit width of the input and output signals. defaults to 16 bits.
both are signed.  
- `widthz : int`: bit width of `zi` and `zo`. defaults to `width`
- `stages : int or none`: number of CORDIC incremental rotation stages.
- `guard: int or None`: adds guard bits to the intermediate signals. defaults to `log_2(width)`, guarentees accuracy to `width` bits
- `eval_mode : str` uses either `iterative, pipelined` or `combinatorial`
- `cordic_mode : str`: either `"rotate" or "vector"`  
