class StaffsController < ApplicationController
  #
  layout :fetch_layouts
  before_action :load_data, only: [:mark_entry,:mark_list,:edit]
  #
  def index
  end
  #
  def mark_entry
    @mark = Mark.new
    respond_to do |format|
      format.html
    end
  end
  #
  def mark_list
    respond_to do |format|
      format.html
    end
  end
  #
  def new
    @role = Staff.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @role = Staff.find_by_id params[:id]
  end
  #
  def load_data
   staff_classes = staff_user.staff_classes
   @class_lists = ClassList.find_all_by_ids(staff_classes.map(&:class_list_id))
   @subs = staff_classes.map(&:subject).flatten
   @students = Student.fetch_by_classes(staff_classes.map(&:class_list_id))
   @exam_types = ExamType.fetch_by_classes(staff_classes.map(&:class_list_id))
  end
end
