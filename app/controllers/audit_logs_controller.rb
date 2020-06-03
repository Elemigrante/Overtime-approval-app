class AuditLogsController < ApplicationController
  before_action :set_audit_log, only: %i[confirm]
  
  def index
    @audit_log = AuditLog.page(params[:page]).per(10)
    authorize @audit_log
  end
  
  def confirm
    authorize @audit_log
    @audit_log.confirmed!
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'The audit log has been confirmed.' }
    end
  end
  
  private

  def set_audit_log
    @audit_log = AuditLog.find(params[:id])
  end
end
