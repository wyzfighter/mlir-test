! Probe 5: two private variables of different types at once.
! Exercises recipe reuse / multiple clause ops in the same construct.
!
! Correct result: a(i) = 5 + i,  sum(a) = 5*100 + 5050 = 5550
program p5
  implicit none
  integer :: i
  integer :: y
  integer :: a(100)
  real :: z
  !$acc parallel loop private(y, z)
  do i = 1, 100
     y = 5 + i
     z = real(y)
     a(i) = y + nint(z) - y
  end do
  print *, "p5 first,last,sum =", a(1), a(100), sum(a)
end program p5
