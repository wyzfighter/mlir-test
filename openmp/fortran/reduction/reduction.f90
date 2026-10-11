program omp_reduction
    implicit none
    integer, parameter :: n = 1000
    real :: data(n)
    real :: total_sum, max_val
    integer :: i

    ! 初始化数组
    do i = 1, n
        data(i) = real(i) * 1.5
    end do

    total_sum = 0.0
    max_val = 0.0

    ! 同时执行求和、求最大值两种归约
    !$omp parallel do reduction(+:total_sum) reduction(max:max_val) private(i) shared(data)
    do i = 1, n
        total_sum = total_sum + data(i)
        max_val = max(max_val, data(i))
    end do
    !$omp end parallel do

    print *, "数组总和：", total_sum
    print *, "数组最大值：", max_val
end program omp_reduction