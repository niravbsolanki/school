<div class="card height-auto">
    <div class="card-body">
        
        <div class="row">
            <div class="col-lg-6 form-group">
                <label>FullName <span class="text-danger">*</span></label>
                <input type="text" name="full_name" id="full_name" placeholder="Full name" value="{{$teacher->full_name ?? ''}}" class="form-control">
                <div class="text text-danger">{{$errors->first('full_name')}}</div>
            </div>
            <div class="col-lg-6 form-group">
                <label>Username <span class="text-danger">*</span></label>
                <input type="text" name="username" id="username" placeholder="Username" value="{{$teacher->username ?? ''}}" class="form-control">
                <div class="text text-danger">{{$errors->first('username')}}</div>
            </div>
            
                
            <div class="col-lg-6 form-group">
                <label>Password @if(!isset($teacher))<span class="text-danger">*</span>@endif</label>
                <input type="text" name="password" id="password" placeholder="Password" class="form-control">
                <div class="text text-danger">{{$errors->first('password')}}</div>
            </div>
            
            <div class="col-lg-6 form-group">
                <label>Phone No</label>
                <input type="text" name="phone" id="phone" placeholder="Phone No" value="{{$teacher->phone ?? ''}}" class="form-control">
                <div class="text text-danger">{{$errors->first('phone')}}</div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 form-group mg-t-8 text-right">
                <a href="{{route('teacher.index')}}" class="btn-fill-lg bg-blue-dark btn-hover-yellow" style="color: white;">Cancel</a>
                <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">{{(!isset($teacher)) ? 'Save' : 'Update'}}</button>
            </div>
        </div>
      
    </div>
</div>