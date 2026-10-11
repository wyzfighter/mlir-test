! Probe 3: `private` array -> exercises the recipe bounds arguments.
!
! Correct result: b is a fresh 10-element array each iteration,
!   a(i) = b(10) = 10,  sum(a) = 1500
program p3
  implicit none
  integer :: i, j
  integer :: a(150)
  integer :: b(10)
  !$acc parallel loop private(b)
  do i = 1, 150
     do j = 1, 10
        b(j) = j
     end do
     a(i) = b(10)
  end do
  print *, "p3 first,last,sum =", a(1), a(150), sum(a)
end program p3
