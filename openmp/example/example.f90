program main
  implicit none
  integer :: i, n, a(100)
  n = 100

  !$omp parallel do
  do i = 1, n
     a(i) = i
  end do
  !$omp end parallel do

  print *, a(1)
end program