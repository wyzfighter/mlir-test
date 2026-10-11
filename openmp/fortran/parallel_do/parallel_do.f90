program omp_parallel_do
    implicit none
    integer, parameter :: n = 1000
    real :: a(n), b(n), c(n)
    integer :: i
    real :: factor

    factor = 3.5

    ! 初始化数组
    do i = 1, n
        a(i) = real(i)
        b(i) = real(i) * 0.5
    end do

    !$omp parallel shared(a, b, c) private(i)
        ! 所有线程共同执行并行区域内代码

        !$omp do
        do i = 1, n
            c(i) = a(i) + b(i)*factor
        end do
        !$omp end do

    !$omp end parallel

    print *, "计算完成，c(1) =", c(1), "c(n) =", c(n)
end program omp_parallel_do