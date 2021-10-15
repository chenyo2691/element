import { createTest, destroyVM } from '../util';
import TestCpt from 'packages/test-cpt';

describe('TestCpt', () => {
  let vm;
  afterEach(() => {
    destroyVM(vm);
  });

  it('create', () => {
    vm = createTest(TestCpt, true);
    expect(vm.$el).to.exist;
  });
});

