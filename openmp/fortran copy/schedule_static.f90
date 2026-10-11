program omp_schedule_static
    implicit none
    integer, parameter :: n = 1000
    real :: a(n)
    integer :: i

    ! 静态均匀分块：将迭代平均拆分给各线程
    !$omp parallel do schedule(static) private(i) shared(a)
    do i = 1, n
        a(i) = sqrt(real(i))
    end do
    !$omp end parallel do

    print *, "静态调度计算完成，a(100) =", a(100)
end program omp_schedule_static