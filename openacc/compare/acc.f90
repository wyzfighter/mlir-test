program main
  implicit none
  integer :: i, n, a(100000)
  n = 1234
  a(5) = 5
  !$acc parallel loop
  do i = 3, n
    a(i+i) = i * i
  end do
  !$acc end parallel loop
end program