program main
  implicit none
  integer :: i, n, a(100)
  n = 100
  !$omp target map(to:n) map(from:a)
  do i = 1, n
  end do
  !$omp end target
end program