.class public Lcom/seeclickfix/ma/android/objects/loc/Geocode;
.super Ljava/lang/Object;
.source "Geocode.java"


# instance fields
.field private address:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "full_address"
    .end annotation
.end field

.field private blockFips:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "block_fips"
    .end annotation
.end field

.field private city:Ljava/lang/String;

.field private countryCode:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "country_code"
    .end annotation
.end field

.field private district:Ljava/lang/String;

.field private districtFips:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "district_fips"
    .end annotation
.end field

.field private isUSA:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "is_us?"
    .end annotation
.end field

.field private lat:D

.field private ll:Ljava/lang/String;

.field private lng:D

.field private precision:Ljava/lang/String;

.field private provider:Ljava/lang/String;

.field private province:Ljava/lang/String;

.field private state:Ljava/lang/String;

.field private stateCombined:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "state_combined"
    .end annotation
.end field

.field private stateFips:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "state_fips"
    .end annotation
.end field

.field private street:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "street_address"
    .end annotation
.end field

.field private subPremise:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sub_premise"
    .end annotation
.end field

.field private success:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getBlockFips()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->blockFips:Ljava/lang/String;

    return-object v0
.end method

.method public getCity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->city:Ljava/lang/String;

    return-object v0
.end method

.method public getCountryCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->countryCode:Ljava/lang/String;

    return-object v0
.end method

.method public getDistrict()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->district:Ljava/lang/String;

    return-object v0
.end method

.method public getDistrictFips()Ljava/lang/String;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->districtFips:Ljava/lang/String;

    return-object v0
.end method

.method public getLat()D
    .locals 2

    .prologue
    .line 98
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lat:D

    return-wide v0
.end method

.method public getLl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->ll:Ljava/lang/String;

    return-object v0
.end method

.method public getLng()D
    .locals 2

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lng:D

    return-wide v0
.end method

.method public getPrecision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->precision:Ljava/lang/String;

    return-object v0
.end method

.method public getProvider()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->provider:Ljava/lang/String;

    return-object v0
.end method

.method public getProvince()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->province:Ljava/lang/String;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getStateCombined()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateCombined:Ljava/lang/String;

    return-object v0
.end method

.method public getStateFips()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateFips:Ljava/lang/String;

    return-object v0
.end method

.method public getStreet()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->street:Ljava/lang/String;

    return-object v0
.end method

.method public getSubPremise()Ljava/lang/String;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->subPremise:Ljava/lang/String;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->success:Z

    return v0
.end method

.method public isUSA()Z
    .locals 1

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->isUSA:Z

    return v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->address:Ljava/lang/String;

    .line 167
    return-void
.end method

.method public setBlockFips(Ljava/lang/String;)V
    .locals 0
    .param p1, "blockFips"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->blockFips:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setCity(Ljava/lang/String;)V
    .locals 0
    .param p1, "city"    # Ljava/lang/String;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->city:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setCountryCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->countryCode:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setDistrict(Ljava/lang/String;)V
    .locals 0
    .param p1, "district"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->district:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public setDistrictFips(Ljava/lang/String;)V
    .locals 0
    .param p1, "districtFips"    # Ljava/lang/String;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->districtFips:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setLat(D)V
    .locals 1
    .param p1, "lat"    # D

    .prologue
    .line 102
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lat:D

    .line 103
    return-void
.end method

.method public setLl(Ljava/lang/String;)V
    .locals 0
    .param p1, "ll"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->ll:Ljava/lang/String;

    .line 199
    return-void
.end method

.method public setLng(D)V
    .locals 1
    .param p1, "lng"    # D

    .prologue
    .line 110
    iput-wide p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lng:D

    .line 111
    return-void
.end method

.method public setPrecision(Ljava/lang/String;)V
    .locals 0
    .param p1, "precision"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->precision:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->provider:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setProvince(Ljava/lang/String;)V
    .locals 0
    .param p1, "province"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->province:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->state:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setStateCombined(Ljava/lang/String;)V
    .locals 0
    .param p1, "stateCombined"    # Ljava/lang/String;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateCombined:Ljava/lang/String;

    .line 183
    return-void
.end method

.method public setStateFips(Ljava/lang/String;)V
    .locals 0
    .param p1, "stateFips"    # Ljava/lang/String;

    .prologue
    .line 222
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateFips:Ljava/lang/String;

    .line 223
    return-void
.end method

.method public setStreet(Ljava/lang/String;)V
    .locals 0
    .param p1, "street"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->street:Ljava/lang/String;

    .line 175
    return-void
.end method

.method public setSubPremise(Ljava/lang/String;)V
    .locals 0
    .param p1, "subPremise"    # Ljava/lang/String;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->subPremise:Ljava/lang/String;

    .line 239
    return-void
.end method

.method public setSuccess(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->success:Z

    .line 95
    return-void
.end method

.method public setUSA(Z)V
    .locals 0
    .param p1, "isUSA"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->isUSA:Z

    .line 191
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Geocode [success="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->success:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lat:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", lng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->lng:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", countryCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->countryCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", city="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->city:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->state:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", province="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->province:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", district="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->district:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", provider="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->provider:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", street="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->street:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", stateCombined="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateCombined:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isUSA="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->isUSA:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", ll="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->ll:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", precision="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->precision:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", districtFips="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->districtFips:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", stateFips="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->stateFips:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", blockFips="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->blockFips:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", subPremise="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/loc/Geocode;->subPremise:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
