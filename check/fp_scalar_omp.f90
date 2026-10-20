!===----------------------------------------------------------------------===!
! Plain OpenMP twin of fp_scalar.f90 (ground truth: never goes through the
! OpenACC -> OpenMP bridge).
!===----------------------------------------------------------------------===!
program fp_scalar
  implicit none
  integer :: i, x
  x = 7
  !$omp parallel do firstprivate(x)
  do i = 1, 4
     x = x + i
     print '(A,I0)', 'fp_scalar ', x
  end do
  !$omp end parallel do
end program fp_scalar
