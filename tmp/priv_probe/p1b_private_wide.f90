! Probe 1b: same as p1 but the private variable stays live across an inner
! loop, which widens the race window by ~50x. If x were shared, several
! threads would clobber each other's accumulation.
!
! Correct result: a(i) = 50*i, sum(a) = 50*80200 = 4010000
program p1b
  implicit none
  integer :: i, k, x
  integer :: a(400)
  !$acc parallel loop private(x)
  do i = 1, 400
     x = 0
     do k = 1, 50
        x = x + i
     end do
     a(i) = x
  end do
  print *, "p1b first,last,sum =", a(1), a(400), sum(a)
end program p1b
