!===----------------------------------------------------------------------===!
! Plain OpenMP twin of fp_array.f90.
!===----------------------------------------------------------------------===!
program fp_array
  implicit none
  integer :: i
  integer :: b(5)
  b = [1, 2, 3, 4, 5]
  !$omp parallel do private(b)
  do i = 1, 5
     b(i) = b(i) + i
     print '(A,I0,A,I0)', 'fp_array ', i, ' ', b(i)
  end do
  !$omp end parallel do
end program fp_array
