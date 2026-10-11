! Probe 6: are we really running on several OS threads?
! Records omp_get_thread_num() per iteration into a shared array.
! max(tid) > 0 proves more than one thread executed the loop.
program p6
  implicit none
  interface
     integer function omp_get_thread_num() bind(c, name="omp_get_thread_num")
     end function omp_get_thread_num
  end interface
  integer :: i
  integer :: tid(1000)
  tid = -1
  !$acc parallel loop private(i)
  do i = 1, 1000
     tid(i) = omp_get_thread_num()
  end do
  print *, "p6 min,max,sum,count>=0 =", minval(tid), maxval(tid), sum(tid), count(tid >= 0)
end program p6
