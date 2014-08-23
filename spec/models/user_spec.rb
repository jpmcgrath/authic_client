require 'rails_helper'

describe User do
  it { expect(User).to respond_to :find_for_authic_oauth }
end