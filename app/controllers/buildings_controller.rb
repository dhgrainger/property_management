class BuildingsController < ApplicationController
  def new
    @building = Building.new
    @states = %w[AL
    AK
    AZ
    AR
    CA
    CO
    CT
    DE
    DC
    FL
    GA
    HI
    ID
    IL
    IN
    IA
    KS
    KY
    LA
    ME
    MD
    MA
    MI
    MN
    MS
    MO
    MT
    NE
    NV
    NH
    NJ
    NM
    NY
    NC
    ND
    OH
    OK
    OR
    PA
    RI
    SC
    SD
    TN
    TX
    UT
    VT
    VA
    WA
    WV
    WI
    WY]
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to new_building_path, notice: 'Building was successfully registered.'
    else
      render action: 'new', notice: "Missing Attributes"
    end
  end

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params['id'])
  end


  private
    def building_params
      params.require(:building).permit(:address, :city, :state, :postal_code, :description, :owner_id)
    end
end
