<style type="text/css">
    .label {
        border-radius: .25em;
    }
</style>
{if $smarty.get.action == "new-email"}
    {if $emails->response->status == "FAILURE"}
        <div class="alert alert-danger">{$emails->response->message}</div>
    {/if}
    <h3>New Accounts</h3>
    <div class="col-md-12">
        <form method="post" class="form-horizontal"
              action="index.php?m={$smarty.get.m}&action={$smarty.get.action}&domainid={$smarty.get.domainid}">
            <div class="box-body">
                {*<div class="form-group">
                    <label for="language" class="col-sm-3 control-label">Email type</label>

                    <div class="col-sm-9">
                        <select id="email-type" name="email-type" class="form-control">
                            <option selected="selected" value="mail">Email Account</option>
                            <option value="mail">Forward only</option>
                        </select>
                    </div>
                </div>*}
                <div class="form-group">
                    <label for="first-name" class="col-sm-3 control-label">First name</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="first-name" id="first-name"
                               placeholder="First name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="last-name" class="col-sm-3 control-label">Last name</label>

                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="last-name" id="last-name" placeholder="Last name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email-address" class="col-sm-3 control-label">Email address</label>

                    <div class="col-sm-9">
                        <div class="input-group col-sm-12">
                            <input name="email-username" id="email-username" type="text" class="form-control"
                                   placeholder="Email username">
                            <span class="input-group-addon alert-info">
                                <strong>@{$domain}</strong>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>

                    <div class="col-sm-9">
                        <div class="input-group col-sm-12">
                            <input type="password" name="password" class="form-control" id="password"
                                   placeholder="Password (8 - 15 digits)">
                            <span class="input-group-addon alert-info">
                                <strong role="button" id="generate-password">Generate password</strong>
                                <span id="pass-text"></span>
                            </span>
                        </div>
                    </div>
                </div>
                {*<div class="form-group">
                    <label for=confirm-password" class="col-sm-3 control-label">Confirm Password</label>

                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="confirm-password" placeholder="Confirm Password">
                    </div>
                </div>*}
                <div class="form-group">
                    <label for="alternative-email" class="col-sm-3 control-label">Alternative Email</label>

                    <div class="col-sm-9">
                        <input type="email" name="alternative-email" class="form-control" id="alternative-email"
                               placeholder="Alternative Email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="language" class="col-sm-3 control-label">Language</label>

                    <div class="col-sm-9">
                        <select id="language" name="language" class="form-control">
                            <option value="zh-CN">Chinese (Simplified)</option>
                            <option value="en" selected="selected">English</option>
                            <option value="de">German</option>
                            <option value="pt-PT">Portuguese</option>
                            <option value="pt_BR">Portuguese - BRAZIL</option>
                            <option value="ru">Russian</option>
                            <option value="sl">Slovenian</option>
                            <option value="es-MX">Spanish (LA)</option>
                            <option value="es">Spanish (Spain)</option>
                            <option value="tr">Turkish</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="col-sm-3 control-label">Country</label>

                    <div class="col-sm-9">
                        <select class="form-control" id="country" name="country">
                            <option value="AF">Afghanistan</option>
                            <option value="AX">Aland Islands</option>
                            <option value="AL">Albania</option>
                            <option value="DZ">Algeria</option>
                            <option value="AS">American Samoa</option>
                            <option value="AD">Andorra</option>
                            <option value="AO">Angola</option>
                            <option value="AI">Anguilla</option>
                            <option value="AQ">Antarctica</option>
                            <option value="AG">Antigua And Barbuda</option>
                            <option value="AR">Argentina</option>
                            <option value="AM">Armenia</option>
                            <option value="AW">Aruba</option>
                            <option value="AU">Australia</option>
                            <option value="AT">Austria</option>
                            <option value="AZ">Azerbaijan</option>
                            <option value="BS">Bahamas</option>
                            <option value="BH">Bahrain</option>
                            <option value="BD" selected="selected">Bangladesh</option>
                            <option value="BB">Barbados</option>
                            <option value="BY">Belarus</option>
                            <option value="BE">Belgium</option>
                            <option value="BZ">Belize</option>
                            <option value="BJ">Benin</option>
                            <option value="BM">Bermuda</option>
                            <option value="BT">Bhutan</option>
                            <option value="BO">Bolivia</option>
                            <option value="BA">Bosnia and Herzegovina</option>
                            <option value="BW">Botswana</option>
                            <option value="BV">Bouvet Island</option>
                            <option value="BR">Brazil</option>
                            <option value="IO">British Indian Ocean Territory</option>
                            <option value="BN">Brunei</option>
                            <option value="BG">Bulgaria</option>
                            <option value="BF">Burkina Faso</option>
                            <option value="BI">Burundi</option>
                            <option value="KH">Cambodia</option>
                            <option value="CM">Cameroon</option>
                            <option value="CA">Canada</option>
                            <option value="CV">Cape Verde</option>
                            <option value="KY">Cayman Islands</option>
                            <option value="CF">Central African Republic</option>
                            <option value="TD">Chad</option>
                            <option value="CL">Chile</option>
                            <option value="CN">China</option>
                            <option value="CX">Christmas Island</option>
                            <option value="CC">Cocos (Keeling) Islands</option>
                            <option value="CO">Colombia</option>
                            <option value="KM">Comoros</option>
                            <option value="CG">Congo</option>
                            <option value="CD">Congo, Democractic Republic</option>
                            <option value="CK">Cook Islands</option>
                            <option value="CR">Costa Rica</option>
                            <option value="CI">Cote D''Ivoire (Ivory Coast)</option>
                            <option value="HR">Croatia (Hrvatska)</option>
                            <option value="CU">Cuba</option>
                            <option value="CY">Cyprus</option>
                            <option value="CZ">Czech Republic</option>
                            <option value="DK">Denmark</option>
                            <option value="DJ">Djibouti</option>
                            <option value="DM">Dominica</option>
                            <option value="DO">Dominican Republic</option>
                            <option value="TP">East Timor</option>
                            <option value="EC">Ecuador</option>
                            <option value="EG">Egypt</option>
                            <option value="SV">El Salvador</option>
                            <option value="GQ">Equatorial Guinea</option>
                            <option value="ER">Eritrea</option>
                            <option value="EE">Estonia</option>
                            <option value="ET">Ethiopia</option>
                            <option value="FK">Falkland Islands (Islas Malvinas)</option>
                            <option value="FO">Faroe Islands</option>
                            <option value="FJ">Fiji Islands</option>
                            <option value="FI">Finland</option>
                            <option value="FR">France</option>
                            <option value="FX">France, Metropolitan</option>
                            <option value="GF">French Guiana</option>
                            <option value="PF">French Polynesia</option>
                            <option value="TF">French Southern Territories</option>
                            <option value="GA">Gabon</option>
                            <option value="GM">Gambia, The</option>
                            <option value="GE">Georgia</option>
                            <option value="DE">Germany</option>
                            <option value="GH">Ghana</option>
                            <option value="GI">Gibraltar</option>
                            <option value="GR">Greece</option>
                            <option value="GL">Greenland</option>
                            <option value="GD">Grenada</option>
                            <option value="GP">Guadeloupe</option>
                            <option value="GU">Guam</option>
                            <option value="GT">Guatemala</option>
                            <option value="GG">Guernsey</option>
                            <option value="GN">Guinea</option>
                            <option value="GW">Guinea-Bissau</option>
                            <option value="GY">Guyana</option>
                            <option value="HT">Haiti</option>
                            <option value="HM">Heard and McDonald Islands</option>
                            <option value="HN">Honduras</option>
                            <option value="HK">Hong Kong S.A.R.</option>
                            <option value="HU">Hungary</option>
                            <option value="IS">Iceland</option>
                            <option value="IN">India</option>
                            <option value="ID">Indonesia</option>
                            <option value="IR">Iran</option>
                            <option value="IQ">Iraq</option>
                            <option value="IE">Ireland</option>
                            <option value="IM">Isle of Man</option>
                            <option value="IL">Israel</option>
                            <option value="IT">Italy</option>
                            <option value="JM">Jamaica</option>
                            <option value="JP">Japan</option>
                            <option value="JE">Jersey</option>
                            <option value="JO">Jordan</option>
                            <option value="KZ">Kazakhstan</option>
                            <option value="KE">Kenya</option>
                            <option value="KI">Kiribati</option>
                            <option value="KR">Korea</option>
                            <option value="KP">Korea, North</option>
                            <option value="KW">Kuwait</option>
                            <option value="KG">Kyrgyzstan</option>
                            <option value="LA">Laos</option>
                            <option value="LV">Latvia</option>
                            <option value="LB">Lebanon</option>
                            <option value="LS">Lesotho</option>
                            <option value="LR">Liberia</option>
                            <option value="LY">Libya</option>
                            <option value="LI">Liechtenstein</option>
                            <option value="LT">Lithuania</option>
                            <option value="LU">Luxembourg</option>
                            <option value="MO">Macau S.A.R.</option>
                            <option value="MK">Macedonia</option>
                            <option value="MG">Madagascar</option>
                            <option value="MW">Malawi</option>
                            <option value="MY">Malaysia</option>
                            <option value="MV">Maldives</option>
                            <option value="ML">Mali</option>
                            <option value="MT">Malta</option>
                            <option value="MH">Marshall Islands</option>
                            <option value="MQ">Martinique</option>
                            <option value="MR">Mauritania</option>
                            <option value="MU">Mauritius</option>
                            <option value="YT">Mayotte</option>
                            <option value="MX">Mexico</option>
                            <option value="FM">Micronesia</option>
                            <option value="MD">Moldova</option>
                            <option value="MC">Monaco</option>
                            <option value="MN">Mongolia</option>
                            <option value="ME">Montenegro</option>
                            <option value="MS">Montserrat</option>
                            <option value="MA">Morocco</option>
                            <option value="MZ">Mozambique</option>
                            <option value="MM">Myanmar</option>
                            <option value="NA">Namibia</option>
                            <option value="NR">Nauru</option>
                            <option value="NP">Nepal</option>
                            <option value="NL">Netherlands</option>
                            <option value="AN">Netherlands Antilles</option>
                            <option value="NC">New Caledonia</option>
                            <option value="NZ">New Zealand</option>
                            <option value="NI">Nicaragua</option>
                            <option value="NE">Niger</option>
                            <option value="NG">Nigeria</option>
                            <option value="NU">Niue</option>
                            <option value="NF">Norfolk Island</option>
                            <option value="MP">Northern Mariana Islands</option>
                            <option value="NO">Norway</option>
                            <option value="OM">Oman</option>
                            <option value="PK">Pakistan</option>
                            <option value="PW">Palau</option>
                            <option value="PS">Palestinian Territory</option>
                            <option value="PA">Panama</option>
                            <option value="PG">Papua new Guinea</option>
                            <option value="PY">Paraguay</option>
                            <option value="PE">Peru</option>
                            <option value="PH">Philippines</option>
                            <option value="PN">Pitcairn Island</option>
                            <option value="PL">Poland</option>
                            <option value="PT">Portugal</option>
                            <option value="PR">Puerto Rico</option>
                            <option value="QA">Qatar</option>
                            <option value="RE">Reunion</option>
                            <option value="RO">Romania</option>
                            <option value="RU">Russia</option>
                            <option value="RW">Rwanda</option>
                            <option value="SH">Saint Helena</option>
                            <option value="KN">Saint Kitts And Nevis</option>
                            <option value="LC">Saint Lucia</option>
                            <option value="PM">Saint Pierre and Miquelon</option>
                            <option value="VC">Saint Vincent And The Grenadines</option>
                            <option value="WS">Samoa</option>
                            <option value="SM">San Marino</option>
                            <option value="ST">Sao Tome and Principe</option>
                            <option value="SA">Saudi Arabia</option>
                            <option value="SN">Senegal</option>
                            <option value="RS">Serbia</option>
                            <option value="CS">Serbia and Montenegro</option>
                            <option value="SC">Seychelles</option>
                            <option value="SL">Sierra Leone</option>
                            <option value="SG">Singapore</option>
                            <option value="SX">Sint Maarten</option>
                            <option value="SK">Slovakia</option>
                            <option value="SI">Slovenia</option>
                            <option value="SB">Solomon Islands</option>
                            <option value="SO">Somalia</option>
                            <option value="ZA">South Africa</option>
                            <option value="GS">South Georgia And The South Sandwich Islands</option>
                            <option value="ES">Spain</option>
                            <option value="LK">Sri Lanka</option>
                            <option value="SD">Sudan</option>
                            <option value="SR">Suriname</option>
                            <option value="SJ">Svalbard And Jan Mayen Islands</option>
                            <option value="SZ">Swaziland</option>
                            <option value="SE">Sweden</option>
                            <option value="CH">Switzerland</option>
                            <option value="SY">Syria</option>
                            <option value="TW">Taiwan</option>
                            <option value="TJ">Tajikistan</option>
                            <option value="TZ">Tanzania</option>
                            <option value="TH">Thailand</option>
                            <option value="TL">Timor-Leste</option>
                            <option value="TG">Togo</option>
                            <option value="TK">Tokelau</option>
                            <option value="TO">Tonga</option>
                            <option value="TT">Trinidad And Tobago</option>
                            <option value="TN">Tunisia</option>
                            <option value="TR">Turkey</option>
                            <option value="TM">Turkmenistan</option>
                            <option value="TC">Turks And Caicos Islands</option>
                            <option value="TV">Tuvalu</option>
                            <option value="UG">Uganda</option>
                            <option value="UA">Ukraine</option>
                            <option value="AE">United Arab Emirates</option>
                            <option value="GB">United Kingdom</option>
                            <option value="US">United States</option>
                            <option value="UM">United States Minor Outlying Islands</option>
                            <option value="UY">Uruguay</option>
                            <option value="UZ">Uzbekistan</option>
                            <option value="VU">Vanuatu</option>
                            <option value="VA">Vatican City State (Holy See)</option>
                            <option value="VE">Venezuela</option>
                            <option value="VN">Vietnam</option>
                            <option value="VG">Virgin Islands British</option>
                            <option value="VI">Virgin Islands US</option>
                            <option value="EH">WESTERN SAHARA</option>
                            <option value="WF">Wallis And Futuna Islands</option>
                            <option value="YE">Yemen</option>
                            <option value="YU">Yugoslavia</option>
                            <option value="ZM">Zambia</option>
                            <option value="ZW">Zimbabwe</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-sm-9 pull-right">
                        <button type="submit" class="btn btn-success pull-left">Create New Account</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
{elseif $smarty.get.action == "forwarder"}
    {if $emails->response->status == "FAILURE"}
        <div class="alert alert-danger">{$emails->response->message}</div>
    {/if}
    <h3>New Forwarder</h3>
    <div class="col-md-12">
        <form method="post" class="form-horizontal"
              action="index.php?m={$smarty.get.m}&action={$smarty.get.action}&domainid={$smarty.get.domainid}">
            <div class="box-body">
                <div class="form-group">
                    <label for="email-address" class="col-sm-3 control-label">Email address</label>

                    <div class="col-sm-9">
                        <div class="input-group col-sm-12">
                            <input name="email-username" id="email-username" type="text" class="form-control"
                                   placeholder="Email username">
                            <span class="input-group-addon alert-info">
                                <strong>@{$domain}</strong>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="alternative-email" class="col-sm-3 control-label">Forward to</label>
                    <div class="col-sm-9">
                        <input type="text" name="forward-to" class="form-control" id="forward-to"
                               placeholder="Forward to (Comma separated [a@mail.com,b@mail.com])">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-sm-9 pull-right">
                        <button type="submit" class="btn btn-success pull-left">Create New Account</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
{elseif $smarty.get.email != ""}
    <h3>Account Details</h3>
    <div class="col-md-12">
        {if $emails->response->status == "SUCCESS"}
            {assign var=mail value=$emails->response->user}
            <table class="table table-striped table-bordered table-responsive table-hover">
                <thead>
                <tr>
                    <th colspan="2">Details of {$emails->response->user->emailAddress}</th>
                </tr>
                </thead>
                <tbody>
                {if $mail->accountType == "FORWARD_ONLY"}
                    <tr>
                        <td>Forward to</td>
                        <td>{$mail->adminForwards}</td>
                    </tr>
                {else}
                    <tr>
                        <td>Name</td>
                        <td>{$mail->firstName} {$mail->lastName}</td>
                    </tr>
                    <tr>
                        <td>Alternate Email</td>
                        <td>{$mail->alternateEmailAddress}</td>
                    </tr>
                    <tr>
                        <td>POP URL</td>
                        <td>
                            {$mail->accountSettings->popSettings}
                            {if $mail->popAccessEnabled}
                                <span class="label label-success">Active</span>
                            {else}
                                <span class="label label-danger">Inactive</span>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td>IMAP URL</td>
                        <td>
                            {$mail->accountSettings->imapSettings}
                            {if $mail->imapAccessEnabled}
                                <span class="label label-success">Active</span>
                            {else}
                                <span class="label label-danger">Inactive</span>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td>SMTP URL</td>
                        <td>{$mail->accountSettings->smtpSettings}</td>
                    </tr>
                    <tr>
                        <td>Webmail URL</td>
                        <td>
                            <a target="_blank" href="{$mail->accountSettings->webmailUrl}">
                                {$mail->accountSettings->webmailUrl}
                            </a>
                            {if $mail->webmailAccessEnabled}
                                <span class="label label-success">Active</span>
                            {else}
                                <span class="label label-danger">Inactive</span>
                            {/if}
                        </td>
                    </tr>
                {/if}
                <tr>
                    <td>Quota</td>
                    <td>{$mail->percentageQuotaUsage}% of {($mail->quotaLimit/1024)} MB</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        {if $mail->status == "ACTIVE"}
                            <span class="label label-success">Active</span>
                        {elseif $mail->status == "SUSPENDED"}
                            <span class="label label-danger">Suspended</span>
                        {elseif $mail->status == "PENDING_ACTIVATION"}
                            <span class="label label-warning">Inactive</span>
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>Created On</td>
                    <td>{date('M d, Y', strtotime($mail->createdOn))}</td>
                </tr>
                <tr>
                    <td>Action</td>
                    <td>
                        <form method="POST"
                              action="index.php?m={$smarty.get.m}&action=delete-account&domainid={$smarty.get.domainid}&email={$user->emailAddress}">
                            <div class="btn-group">
                                <a href="index.php?m={$smarty.get.m}&action=accounts&domainid={$smarty.get.domainid}"
                                   class="btn btn-sm btn-primary" title="Back">
                                    <i class="fas fa fa-arrow-alt-left"></i>
                                </a>
                                {*<a href="index.php?m={$smarty.get.m}&action=edit-accounts&domainid={$smarty.get.domainid}"
                                   class="btn btn-sm btn-primary" title="Edit">
                                    <i class="fas fa fa-edit"></i>
                                </a>*}
                                <button class="btn btn-sm btn-primary">
                                    <i class="fas fa fa-trash"></i>
                                </button>
                            </div>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        {else}
            <div class="alert alert-danger">{$emails->message}</div>
        {/if}
    </div>
{else}
    <h3>Email Accounts of {$domain}</h3>
    {if $emails->response->status == "SUCCESS"}
        <div class="col-md-12">
            {if count($emails->response->users) > 0 }
                <table class="table table-striped table-bordered table-responsive table-hover">
                    <thead>
                    <tr>
                        <th>SL</th>
                        <th>Email/User</th>
                        <th>Type</th>
                        <th>Quote Used</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    {assign var=sl value=1}
                    {foreach $emails->response->users as $user}
                        {if $user->status == "ACTIVE"}
                            {$statusClass = 'success'}
                        {elseif $user->status == "SUSPENDED"}
                            {$statusClass = 'danger'}
                        {else}
                            {$statusClass = 'info'}
                            {$statusClass = 'warning'}
                        {/if}
                        <tr class="">
                            <td>{$sl}</td>
                            <td>
                                <a href="index.php?m={$smarty.get.m}&a=accounts&domainid={$smarty.get.domainid}&email={$user->emailAddress}">
                                    {$user->emailAddress}</a>
                                {if $user->accountType == "FORWARD_ONLY"}
                                    {assign var=forwards value=explode(",",$user->adminForwards)}
                                    {foreach $forwards as $forward}
                                        <br />
                                        <i class="fas fa fa-arrow-alt-right"></i>
                                        {$forward}
                                    {/foreach}
                                {/if}
                            </td>
                            <td>
                                {if $user->accountType == "FORWARD_ONLY"}
                                    Forwarder
                                {else}
                                    Email
                                {/if}
                            </td>
                            <td>
                                <span class="label label-primary">
                                    {$user->percentageQuotaUsage}% of {($user->quotaLimit/1024)} MB
                                </span>
                            </td>
                            <td>
                                {if $user->status == "ACTIVE"}
                                    <span class="label label-success">Active</span>
                                {elseif $user->status == "SUSPENDED"}
                                    <span class="label label-danger">Suspended</span>
                                {elseif $user->status == "PENDING_ACTIVATION"}
                                    <span class="label label-warning">Inactive</span>
                                {/if}
                            </td>

                            <td>
                                <form method="POST"
                                      action="index.php?m={$smarty.get.m}&action=delete-account&domainid={$smarty.get.domainid}&email={$user->emailAddress}">
                                    <div class="btn-group">
                                        <a href="index.php?m={$smarty.get.m}&action=accounts&domainid={$smarty.get.domainid}&email={$user->emailAddress}"
                                           class="btn btn-sm btn-primary" title="View Detail">
                                            <i class="fas fa fa-eye"></i>
                                        </a>
                                        {*<a href="index.php?m={$smarty.get.m}&action=edit-accounts&domainid={$smarty.get.domainid}&email={$user->emailAddress}" class="btn btn-sm btn-primary" title="Edit">
                                            <i class="fa fa-edit"></i>
                                        </a>*}
                                        <button class="btn btn-sm btn-primary">
                                            <i class="fas fa fa-trash"></i>
                                        </button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        {assign var=sl value=($sl+1)}
                    {/foreach}
                </table>
            {else}
                <div class="alert alert-info">No E-mail accounts found !</div>
            {/if}
        </div>
    {elseif $emails->message == "You need to activate your FREE Email Services before you can perform this action"}
        <div class="alert alert-warning">{$emails->message}</div>
    {else}
        <div class="alert alert-danger">{$emails->message}</div>
    {/if}
{/if}

<script type="text/javascript">
    var passDiv = $("#generate-password");

    passDiv.click(function () {
        var pass = Math.random().toString(32).slice(3);
        passDiv.html("Generated password :");
        $("#pass-text").html(pass);
        $("#password").val(pass);
    });
</script>
