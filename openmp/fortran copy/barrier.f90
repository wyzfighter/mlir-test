program omp_barrier
    implicit none
    integer, parameter :: n = 100
    real :: data(n)
    integer :: i

    !$omp parallel private(i) shared(data)
        ! 第一步：各线程完成数组初始化
        !$omp do
        do i = 1, n
            data(i) = real(i)
        end do
        !$omp end do

        ! 显式屏障：所有线程都完成第一步后，才继续执行第二步
        !$omp barrier

        ! 第二步：基于完整初始化的数据做平方计算
        !$omp do
        do i = 1, n
            data(i) = data(i) * data(i)
        end do
        !$omp end do
    !$omp end parallel

    print *, "屏障同步后计算完成，data(5) =", data(5)
end program omp_barrier