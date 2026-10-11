program omp_firstprivate
    implicit none
    integer, parameter :: n = 10
    real :: base_val
    integer :: i
    real :: result(n)

    base_val = 100.0

    ! 进入并行区域时，用主机端原值初始化每个线程的私有副本
    !$omp parallel do firstprivate(base_val) private(i) shared(result)
    do i = 1, n
        result(i) = base_val + real(i)
    end do
    !$omp end parallel do

    print *, "结果数组第一个元素：", result(1)
end program omp_firstprivate