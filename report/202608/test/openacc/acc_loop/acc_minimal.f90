program main
  implicit none
  integer :: i, n, a(100)
  n = 100
  !$acc serial loop
  do i = 1, 100
  end do
  !$acc end serial loop
  print *, a(1)
end program
