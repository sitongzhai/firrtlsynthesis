circuit FixedPrecisionChanger : @[:@2.0]
  module FixedPrecisionChanger : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : SInt<64> @[:@6.4]
    output io_out : SInt<64> @[:@6.4]
  
    reg reg_ : SInt<64>, clock with :
      reset => (UInt<1>("h0"), reg_) @[FixedPrecisionChangerSpec.scala 18:16:@11.4]
    io_out <= shr(reg_, 42)
    reg_ <= io_in
