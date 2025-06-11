module liquidlink_protocol::profile {
    // === Imports ===
    use std::ascii::{Self, String};
    use std::type_name::{Self, TypeName};
    use std::string::utf8;

    use iota::vec_map::{Self, VecMap};
    use iota::table::{Self, Table};
    use iota::dynamic_field as df;
    use iota::dynamic_object_field as dof;
    use iota::display;
    use iota::package;
    use iota::clock::Clock;

    use liquidlink_protocol::point::{Self, PointKey, AddPointRequest, SubPointRequest, StakePointRequest, UnstakePointRequest, PointDashBoard};
    use liquidlink_protocol::point::{borrow_amount, borrow_owner};
    use liquidlink_protocol::event;

    use share::core::{Self, State, AdminCap as ShareAdminCap};
    use share::core::{is_invitee, get_inviter};

    // === Errors ===
    const ERR_REGISTERED_MODULE: u64 = 101;
    const ERR_ALREADY_ADDED_STATE: u64 = 102;
    const ERR_NOT_EXIST_STATE: u64 = 103;
    const ERR_NOT_EXIST_TYPE: u64 = 104;

    // === Constants ===
    const VERSION: u64 = 1;
    // display fields
    const NAME: vector<u8> = b"{name}";
    const IMAGE_URL: vector<u8> = b"https://liquidlink.io/api/profile/{id}/image";
    const DESCRIPTION: vector<u8> = b"{name}'s profile at LiquidLink. Check it out at https://liquidlink.io/{id}. Create your own at https://liquidlink.io";

    public struct PROFILE has drop {}

    // === Structs ===
    public struct AdmincCap has key, store {
        id: UID
    }

    public struct ProfileRegistry has key{
        id: UID,
        version: u64,
        /// Mapping owner address to Profile ID
        registry: Table<address, ID>
    }

    public struct Profile has key{
        id: UID,
        owner: address,
        created_at: u64,
        avatar_url: String,
        name: String,
        description: String,
        metadata: VecMap<String, String>
    }

    // === Method Aliases ===

    // === Public-View Functions ===
    public fun owner(self: &Profile):address{
        abort 0
    }
    
    public fun avatar_url(self: &Profile):String{
        abort 0
    }
    
    public fun name(self: &Profile):String{
        abort 0
    }
    
    public fun description(self: &Profile):String{
        abort 0
    }
    
    public fun metadata(self: &Profile):VecMap<String, String>{
        abort 0
    }
    
    public fun profile_contains(reg: &ProfileRegistry, owner: address):bool{
        abort 0
    }
    
    public fun profile_of(reg: &ProfileRegistry, owner: address):ID{
        abort 0
    }
    
    // Point
    public fun point_key<T: drop>(reg: &ProfileRegistry):&PointKey<T>{
        abort 0
    }

    public fun borrow_df_state<T, S: store>(
        self: &Profile,
        _key: &PointKey<T>
    ):&S{
        abort 0
    }
    
    public fun borrow_dof_state<T, S: key + store>(
        self: &Profile,
        _key: &PointKey<T>
    ):&S{
        abort 0
    }

    public fun df_state_exists<T>(
        self: &Profile,
        _key: &PointKey<T>
    ):bool{
        abort 0
    }
    
    public fun dof_state_exists<T>(
        self: &Profile,
        _key: &PointKey<T>
    ):bool{
        abort 0
    }

    public fun df_state_exists_with_type<T, S: store>(
        self: &Profile,
        _key: &PointKey<T>
    ):bool{
        abort 0
    }
    
    public fun dof_state_exists_with_type<T, S: key + store>(
        self: &Profile,
        _key: &PointKey<T>
    ):bool{
        abort 0
    }
    
    public fun module_exist<T: drop>(
        reg: &ProfileRegistry
    ):bool{
        abort 0
    }

    // === Public-Mutative Functions ===
    public fun point_key_mut<T: drop>(
        reg: &mut ProfileRegistry,
        _witness: &mut T
    ):&mut PointKey<T>{
        abort 0
    }
    
    public fun borrow_df_state_mut<T, S: store>(
        self: &mut Profile,
        _point_key: &mut PointKey<T>
    ):&mut S{
        abort 0
    }

    public fun borrow_dof_state_mut<T, S: key + store>(
        self: &mut Profile,
        _key: &PointKey<T>
    ):&mut S{
        abort 0
    }

    // === Admin Functions ===
    fun init(otw: PROFILE, ctx: &mut TxContext){
        abort 0
    }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext){
        abort 0
    }

    public fun register_point_module<T:drop>(
        _cap: &AdmincCap,
        reg: &mut ProfileRegistry
    ){
        abort 0
    }

    public fun remove_point_module<T: drop>(
        _cap: &AdmincCap,
        reg: &mut ProfileRegistry
    ){
        abort 0
    }

    #[allow(lint(share_owned))]
    entry public fun new_point_dashboard<T: drop>(
        cap: &AdmincCap,
        reg: &mut ProfileRegistry,
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun add_point_by_admin<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        _cap: &AdmincCap,
        req: AddPointRequest<T>,
        state: &mut State,
    ){
        abort 0
    }

    public fun sub_point_by_admin<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        _cap: &AdmincCap,
        req: SubPointRequest<T>
    ){
        abort 0
    }

    public fun stake_point_by_admin<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        _cap: &AdmincCap,
        req: StakePointRequest<T>,
        state: &mut State,
    ){
        abort 0
    }

    public fun unstake_point_by_admin<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        _cap: &AdmincCap,
        req: UnstakePointRequest<T>
    ){
        abort 0
    }

    // === Public-Package Functions ===
    public fun register(
        reg: &mut ProfileRegistry,
        avatar_url: String,
        name: String,
        description: String,
        metadata_keys: vector<String>,
        metadata_values: vector<String>,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun register_for(
        reg: &mut ProfileRegistry,
        owner: address,
        avatar_url: String,
        name: String,
        description: String,
        metadata_keys: vector<String>,
        metadata_values: vector<String>,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }
    
    public fun drop(
        profile: Profile,
        reg: &mut ProfileRegistry
    ){
        abort 0
    }

    public fun update_avatar_url(
        self: &mut Profile,
        url: String,
    ){
        abort 0
    }

    public fun update_name(
        self: &mut Profile,
        name: String,
    ){
        abort 0
    }

    public fun update_description(
        self: &mut Profile,
        description: String,
    ){
        abort 0
    }

    public fun update_metadata(
        self: &mut Profile,
        key: String,
        value: String
    ){
        abort 0
    }

    public fun remove_metadata(
        self: &mut Profile,
        key: String
    ){
        abort 0
    }

    public fun add_df_state<T, S: store>(
        self: &mut Profile,
        _key: &mut PointKey<T>,
        state: S
    ){
        abort 0
    }

    public fun add_dof_state<T, S: key + store>(
        self: &mut Profile,
        _key: &mut PointKey<T>,
        state: S
    ){
        abort 0
    }

    public fun remove_df_state<T, S: store>(
        self: &mut Profile,
        _key: &mut PointKey<T>,
    ):S{
        abort 0
    }

    public fun remove_dof_state<T, S: key + store>(
        self: &mut Profile,
        _key: &mut PointKey<T>
    ):S{
        abort 0
    }

    // === Private Functions ===
    fun register_(
        reg: &mut ProfileRegistry,
        owner: address,
        created_at: u64,
        avatar_url: String,
        name: String,
        description: String,
        metadata: VecMap<String, String>,
        ctx: &mut TxContext
    ):Profile{
        abort 0
    }

    // === Test Functions ===
    #[test_only]
    use iota::test_utils;
    #[test_only]
    public struct DFState has store{}
    #[test_only]
    public struct DOFState has key, store{
        id: UID
    }
    #[test]
    fun test_basic(){
        abort 0
    }
} 