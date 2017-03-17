class Api::InvitationsController < ActionController::Base
  before_filter :validate_pass_and_user, :extract_drip_email

  def create
    i = Invitation.new
    i.user_id = @user.id
    i.email = @email
    i.memo = <<-EOF
Welcome to Market News! You're receiving this invitation because you signed up for the
Reify mailing list. We maintain Market News as a hub for resources and conversation in
the B2B SaaS market. We hope you enjoy!
    EOF

    begin
      i.save!
      i.send_email
      render :json => {:message => "Success!"}
    rescue
      render :json => {:message => "Invalid email"}
    end
  end

  private
  def validate_pass_and_user
    if params[:api_secret] == ENV['API_SECRET']
      if (user_id = params[:user_id]) && (@user = User.find(user_id)) && @user.can_invite?
        true
      else
        render json: {}, status: 403
      end
    else
      render json: {}, status: 403
    end
  end

  def extract_drip_email
    if event = JSON.parse(request.body.read, symbolize_names: true)
      @email = event[:data][:subscriber][:email]
    else
      render json: {}, status: 404
    end
  end
end
