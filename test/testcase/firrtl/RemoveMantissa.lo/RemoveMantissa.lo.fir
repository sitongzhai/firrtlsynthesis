circuit RemoveMantissa : @[:@2.0]
  module RemoveMantissa : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_in : SInt<12> @[:@6.4]
    output io_out : SInt<8> @[:@6.4]
  
    reg reg_ : SInt<12>, clock with :
      reset => (UInt<1>("h0"), reg_) @[FixedPrecisionChangerSpec.scala 35:16:@11.4]
    io_out <= shr(reg_, 4)
    reg_ <= io_in
