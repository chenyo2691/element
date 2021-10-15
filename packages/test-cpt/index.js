import TestCpt from './src/main';

/* istanbul ignore next */
TestCpt.install = function(Vue) {
  Vue.component(TestCpt.name, TestCpt);
};

export default TestCpt;
