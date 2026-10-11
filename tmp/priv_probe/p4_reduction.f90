! Probe 4: `reduction(+:s)`.
!
! The pass currently falls back to the host variable for reductions.
! Correct result: s = 5050
program p4
  implicit none
  integer :: i, s
  s = 0
  !$acc parallel loop reduction(+:s)
  do i = 1, 100
     s = s + i
  end do
  print *, "p4 s =", s
end program p4
