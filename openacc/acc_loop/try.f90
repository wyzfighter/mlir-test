program main
  implicit none
  integer :: i, n, a(100000)
  n = 1234
  !$acc parallel loop firstprivate(i)
  do i = 1, n
    a(i+i) = i * i
  end do
  !$acc end parallel loop
end program