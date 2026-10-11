program omp_ordered
    implicit none
    integer, parameter :: n = 10
    integer :: result(n)
    integer :: i

    ! 循环标记 ordered，支持有序代码块
    !$omp parallel do ordered private(i) shared(result)
    do i = 1, n
        result(i) = i * i

        ! ordered 块内严格按循环迭代顺序执行
        !$omp ordered
            print *, "迭代", i, "计算结果：", result(i)
        !$omp end ordered
    end do
    !$omp end parallel do

end program omp_ordered