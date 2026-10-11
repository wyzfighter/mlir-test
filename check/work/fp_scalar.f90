!===----------------------------------------------------------------------===!
! 1. scalar firstprivate.
!
! x starts at 7 and is incremented by i = 1..4 inside the region.  A
! firstprivate variable holds a per-thread copy of the enclosing value, so the
! copy is observable through the arithmetic itself:
!   T=1 -> 8 10 13 17        T=4 -> 8 9 10 11 (order varies)
! A lost copy leaves x holding garbage and changes these values.
!===----------------------------------------------------------------------===!
program fp_scalar
  implicit none
  integer :: i, x
  x = 7
  !$acc parallel loop private(x)
  do i = 1, 4
     x = x + i
     print '(A,I0)', 'fp_scalar ', x
  end do
  !$acc end parallel loop
end program fp_scalar
