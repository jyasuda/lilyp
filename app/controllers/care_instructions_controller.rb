class CareInstructionsController < ApplicationController
  # GET /care_instructions
  # GET /care_instructions.xml
  def index
    @care_instructions = CareInstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @care_instructions }
    end
  end

  # GET /care_instructions/1
  # GET /care_instructions/1.xml
  def show
    @care_instruction = CareInstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @care_instruction }
    end
  end

  # GET /care_instructions/new
  # GET /care_instructions/new.xml
  def new
    @care_instruction = CareInstruction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @care_instruction }
    end
  end

  # GET /care_instructions/1/edit
  def edit
    @care_instruction = CareInstruction.find(params[:id])
  end

  # POST /care_instructions
  # POST /care_instructions.xml
  def create
    @care_instruction = CareInstruction.new(params[:care_instruction])

    respond_to do |format|
      if @care_instruction.save
        format.html { redirect_to(@care_instruction, :notice => 'Care instruction was successfully created.') }
        format.xml  { render :xml => @care_instruction, :status => :created, :location => @care_instruction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @care_instruction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /care_instructions/1
  # PUT /care_instructions/1.xml
  def update
    @care_instruction = CareInstruction.find(params[:id])

    respond_to do |format|
      if @care_instruction.update_attributes(params[:care_instruction])
        format.html { redirect_to(@care_instruction, :notice => 'Care instruction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @care_instruction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /care_instructions/1
  # DELETE /care_instructions/1.xml
  def destroy
    @care_instruction = CareInstruction.find(params[:id])
    @care_instruction.destroy

    respond_to do |format|
      format.html { redirect_to(care_instructions_url) }
      format.xml  { head :ok }
    end
  end
end
