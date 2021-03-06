! RUN: %python %S/test_errors.py %s %flang_fc1
! Test SELECT TYPE and ASSOCIATE errors: C1103

subroutine s1()
  class(*),allocatable :: calc[:]
  integer,save :: icoa[*]
  !ERROR: Selector must not be a coindexed object
  associate(sel=>icoa[2])
  end associate
  icoa = 2
  allocate(integer::calc[*])
  !ERROR: Selector must not be a coindexed object
  select type(sel=>calc[2])
  end select
end subroutine
