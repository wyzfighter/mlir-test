program omp_single
    use omp_lib
    integer :: a, b, c
    a = 1
    b = 2
    c = 0
        !$omp single
            c = a + b
        !$omp end single
end program omp_single