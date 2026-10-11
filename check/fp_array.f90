!===----------------------------------------------------------------------===!
! 2. array firstprivate.
!
! This is the case where a missing copy cannot be seen from the final output:
! OpenMP's firstprivate mutates the private copy only, which is discarded when
! the region ends, so b keeps its original values either way.  The PRINT INSIDE
! THE LOOP is what makes the private copy observable -- without the copy the
! elements read as 0 and the values below are wrong.
!
! b = [1,2,3,4,5];  b(i) = b(i) + i  ->  b(i) = 2 4 6 8 10
!===----------------------------------------------------------------------===!
program fp_array
  implicit none
  integer :: i
  integer :: b(5)
  b = [1, 2, 3, 4, 5]
  !$acc parallel loop private(b)
  do i = 1, 5
     b(i) = b(i) + i
     print '(A,I0,A,I0)', 'fp_array ', i, ' ', b(i)
  end do
  !$acc end parallel loop
end program fp_array
