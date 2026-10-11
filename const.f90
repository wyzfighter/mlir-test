program main
  implicit none
  integer :: x, i, n
  n = 1234
  !$acc parallel firstprivate(x)
  !$acc loop
  do i = 1, n
    x = i*i
  end do
  !$acc end loop
  print *, x
  !$acc end parallel
end program