! Probe 1c: p1 with a much larger iteration count, to give a shared-copy
! mutant enough scheduling opportunities to actually race.
!
! Correct result: a(i) = i + 1000,
!   sum(a) = 2000000*1000 + 2000000*2000001/2 = 2001001000000
program p1c
  implicit none
  integer :: i, x
  integer :: a(2000000)
  integer(8) :: s, expect
  !$acc parallel loop private(x)
  do i = 1, 2000000
     x = 0
     x = x + i
     x = x + 1000
     a(i) = x
  end do
  s = sum(int(a, 8))
  expect = 2000000_8*1000_8 + 2000000_8*2000001_8/2_8
  print *, "p1c expect,got,match =", expect, s, s == expect
end program p1c
