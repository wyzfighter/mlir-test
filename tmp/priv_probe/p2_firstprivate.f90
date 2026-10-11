! Probe 2: `firstprivate` scalar.
!
! Requires BOTH the private allocation and the copy of the host value into it.
! Correct result: a(i) = 7 + i, sum(a) = 10*7 + 55 = 125
! If only the allocation is materialized (copy region dropped), the private
! copy holds whatever was on the stack -> garbage.
program p2
  implicit none
  integer :: i, x
  integer :: a(10)
  x = 7
  !$acc parallel loop firstprivate(x)
  do i = 1, 10
     x = x + i
     a(i) = x
  end do
  print *, "p2 sum =", sum(a), " host x =", x
end program p2
