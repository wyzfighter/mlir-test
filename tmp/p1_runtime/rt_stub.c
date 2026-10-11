/* Minimal stubs for the Fortran program entry points referenced by the
   ACC->OMP bridged module, so the produced LLVM IR can be linked and run
   without the full Fortran runtime. */
void _FortranAProgramStart(int unit, void *a, void *b, void *c) {}
void _FortranAProgramEndStatement(void) {}
