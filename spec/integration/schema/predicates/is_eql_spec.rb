# frozen_string_literal: true

RSpec.describe "Predicates: Eql" do
  context "with required" do
    subject(:schema) do
      Dry::Schema.define do
        required(:foo) { is_eql?(23) }
      end
    end

    context "with valid input" do
      let(:input) { {foo: 23} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with missing input" do
      let(:input) { {} }

      it "is not successful" do
        expect(result).to be_failing ["is missing", "must be equal to 23"]
      end
    end

    context "with nil input" do
      let(:input) { {foo: nil} }

      it "is not successful" do
        expect(result).to be_failing ["must be equal to 23"]
      end
    end

    context "with blank input" do
      let(:input) { {foo: ""} }

      it "is not successful" do
        expect(result).to be_failing ["must be equal to 23"]
      end
    end
  end

  context "with optional" do
    subject(:schema) do
      Dry::Schema.define do
        optional(:foo) { is_eql?(23) }
      end
    end

    context "with valid input" do
      let(:input) { {foo: 23} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with missing input" do
      let(:input) { {} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with nil input" do
      let(:input) { {foo: nil} }

      it "is not successful" do
        expect(result).to be_failing ["must be equal to 23"]
      end
    end

    context "with blank input" do
      let(:input) { {foo: ""} }

      it "is not successful" do
        expect(result).to be_failing ["must be equal to 23"]
      end
    end
  end

  context "as macro" do
    context "with required" do
      context "with value" do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).value(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is not successful" do
            expect(result).to be_failing ["is missing", "must be equal to 23"]
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end
      end

      context "with filled" do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).filled(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is not successful" do
            expect(result).to be_failing ["is missing", "must be equal to 23"]
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled", "must be equal to 23"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled", "must be equal to 23"]
          end
        end
      end

      context "with maybe" do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).maybe(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is not successful" do
            expect(result).to be_failing ["is missing", "must be equal to 23"]
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end
      end
    end

    context "with optional" do
      context "with value" do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).value(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end
      end

      context "with filled" do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).filled(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled", "must be equal to 23"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled", "must be equal to 23"]
          end
        end
      end

      context "with maybe" do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).maybe(is_eql?: 23)
          end
        end

        context "with valid input" do
          let(:input) { {foo: 23} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be equal to 23"]
          end
        end
      end
    end
  end
end
