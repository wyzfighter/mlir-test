program omp_private
    implicit none
    integer, parameter :: n = 100
    real :: sum_total
    integer :: i
    real :: tmp  ! 每个线程拥有独立副本

    sum_total = 0.0

    !$omp parallel private(tmp, i) shared(sum_total)
        tmp = 0.0  ! 私有变量初始值未定义，需手动初始化

        !$omp do
        do i = 1, n
            tmp = tmp + real(i)
        end do
        !$omp end do

        !$omp critical
            sum_total = sum_total + tmp
        !$omp end critical
    !$omp end parallel

    print *, "累加结果：", sum_total
end program omp_private