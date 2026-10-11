program omp_lastprivate
    implicit none
    integer, parameter :: n = 100
    real :: final_val
    integer :: i

    ! 循环结束后，将最后一次迭代的变量值写回主线程
    !$omp parallel do lastprivate(final_val) private(i)
    do i = 1, n
        final_val = real(i) * 3.0
    end do
    !$omp end parallel do

    print *, "最后一次迭代的 final_val 值：", final_val  ! 结果应为 300.0
end program omp_lastprivate