#include <ruby.h>
#include <stdio.h>

VALUE rb_mExample;
VALUE rb_cClass;

VALUE print_string(VALUE class, VALUE arg) {
  printf("%s", RSTRING_PTR(arg));
  return Qnil;
}

void Init_example() {
  rb_mExample = rb_define_module("Example");
  rb_cClass = rb_define_class_under(rb_mExample, "Hoge", rb_cObject);
  rb_define_method(rb_cClass, "print_string", print_string, 1);
}
