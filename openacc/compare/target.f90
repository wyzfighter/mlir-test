program main
  implicit none
  integer :: i, n, a(100000)
  n = 1234
  a(5) = 5
  !$omp target teams distribute parallel do
  do i = 3, n
    a(i+i) = i * i
  end do
  !$omp end target teams distribute parallel do
end program