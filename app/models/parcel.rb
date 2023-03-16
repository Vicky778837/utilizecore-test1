# frozen_string_literal: true

class Parcel < ApplicationRecord
  include PgSearch::Model
    before_create :generate_parcel_number

 before_create :send_parcel_notification

  STATUS = ['Sent', 'In Transit', 'Delivered'].freeze
  PAYMENT_MODE = %w[COD Prepaid].freeze

  validates :weight, :status, :cost, presence: true
  validates :status, inclusion: STATUS
  validates :payment_mode, inclusion: PAYMENT_MODE

  belongs_to :service_type
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  after_create :send_notifications

  pg_search_scope :search_by_parcel_number, against: :parcel_number

  private
  def send_parcel_notification
    UserMailer.status_email(self).deliver_now
  end
  def send_notification
    NotificationWorker.perform_async(self.id)
  end


  def generate_parcel_number
    self.parcel_number = SecureRandom.hex(8)
  end
end


   