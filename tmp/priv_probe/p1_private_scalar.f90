! Probe 1: explicit `private` scalar that is written AND read inside the loop.
!
! Correct result requires a per-iteration private copy of x:
!   a(i) = i + 1000,  sum(a) = 400*1000 + 80200 = 480200
! If x were shared, the three statements would race and the result would differ.
program p1
  implicit none
  integer :: i, x
  integer :: a(400)
  !$acc parallel loop private(x)
  do i = 1, 400
     x = 0
     x = x + i
     x = x + 1000
     a(i) = x
  end do
  print *, "p1 first,last,sum =", a(1), a(400), sum(a)
end program p1
