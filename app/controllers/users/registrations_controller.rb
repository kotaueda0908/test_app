class Users::RegistrationsController < Devise::RegistrationsController #deviseの該当クラスを継承する
  def create
    super do                                             # deviseの他の機能は維持したまま
      resource.update(confirmed_at: Time .now.utc)       # skip_confirmation!と同一処理を行い自動で認証をクローズする
    end
  end

  # アカウント情報変更後、記事一覧にリダイレクトさせる
  def after_update_path_for(resource)
    articles_path(resource)
  end
end