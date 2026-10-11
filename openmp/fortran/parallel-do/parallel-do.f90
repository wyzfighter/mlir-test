program omp_parallel_do_combined
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

    ! parallel + do 合并书写，科学计算最常用形式
    !$omp parallel do private(i) shared(a, b, c, factor)
    do i = 1, n
        c(i) = a(i) + b(i) * factor
    end do
    !$omp end parallel do

    print *, "计算完成，c(5) =", c(5)
end program omp_parallel_do_combined