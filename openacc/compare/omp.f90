program main
  implicit none
  integer :: i, n, a(100000)
  n = 1234
  !$omp parallel do
  do i = 3, n
    a(i+i) = i * i
  end do
  !$omp end parallel do
end program