module liquidlink_protocol::point {
    use std::ascii::String;
    use std::option::{Self, Option};

    use iota::event;
    use iota::clock::Clock;
    use iota::table::{Self, Table};
    use iota::vec_map::{Self, VecMap};
    use iota::object::{Self, UID, ID};
    use iota::transfer;
    use iota::tx_context::TxContext;

    use liquidlink_protocol::constant;

    // === const ===
    const ERR_OBSOLETE_REQUEST: u64 = 101;

    // === struct ===

    /// PointKey to access Profile's Point instance
    public struct PointKey<phantom T> has store{}

    public(package) fun new_point_key<T>():PointKey<T>{
        abort 0
    }
    
    public(package) fun drop_point_key<T>(key: PointKey<T>){
        abort 0
    }

    /// PointReq to send the update point request
    public struct AddPointRequest<phantom T> has key{
        id: UID,
        owner: address,
        action: String,
        value: u256
    }
    
    public struct SubPointRequest<phantom T> has key{
        id: UID,
        owner: address,
        action: String, //! only `basis`
        value: u256
    }
    
    public struct StakePointRequest<phantom T> has key{
        id: UID,
        owner: address,
        action: String, // borrow/psm
        weight: u256, // amount
        duration: u64,  
        timestamp: u64 // createAt
    }
    
    public struct UnstakePointRequest<phantom T> has key{
        id: UID,
        owner: address,
        action: String,
        weight: u256,
        duration: u64,
        timestamp: u64
    }
    
    public struct BorrowPointRequest<phantom T> has key{
        id: UID,
        owner: address,
        collateral_amount: u256,
        borrow_amount: u256,
        duration: u64,
        timestamp: u64
    }
    
    public struct RepayPointRequest<phantom T> has key{
        id: UID,
        owner: address,
        repay_amount: u256,
        timestamp: u64
    }
    
    public struct UserInfo has store, copy, drop{
        points: VecMap<String, u256>, // action -> String (for add/sub points)
        configs: VecMap<String, Config> // action -> String (for stake/unstake points)
    }

    // Record the stake information
    public struct Config has store, copy, drop{
        weight: u256,
        last_update: u64,
        duration: u64
    }

    /// Point Dashboard shared object
    public struct PointDashBoard<phantom T> has key, store{
        id: UID,
        total_points: u256,
        user_infos: Table<address, UserInfo>,
    }
    
    public(package) fun new_point_dashboard<T>(ctx: &mut TxContext):PointDashBoard<T>{
        abort 0
    }

    // === VIEW ===

    public fun total_points<T>(dashboard: &PointDashBoard<T>):u256{
        abort 0
    }

    public fun get_user_info<T>(dashboard: &PointDashBoard<T>, user: address):Option<UserInfo>{
        abort 0
    }

    /// @return sum of stake and normal points of the user
    public fun get_user_info_points<T>(
        dashboard: &PointDashBoard<T>,
        user: address,
        clock: &Clock
    ):u256{
        abort 0
    }
    
    /// @return sum of stake and normal points of the user by specific action
    public fun get_user_info_point_by_action<T>(
        dashboard: &PointDashBoard<T>,
        // share object
        user: address,
        action: String,
        clock: &Clock
    ):u256{
        abort 0
    }

    // === event ===
    public struct LiquidlinkAddPointEvent<phantom T> has copy, drop{
        owner: address,
        action: String,
        req: ID,
        value: u256,
    }
    
    public struct LiquidlinkSubPointEvent<phantom T> has copy, drop{
        owner: address,
        action: String,
        req: ID,
        value: u256,
    }
    
    public struct LiquidlinkStakePointEvent<phantom T> has copy, drop{
        owner: address,
        action: String,
        req: ID,
        weight: u256,
        timestamp: u64,
        duration: u64,
    }
    
    public struct LiquidlinkUnstakePointEvent<phantom T> has copy, drop{
        owner: address,
        action: String,
        req: ID,
        weight: u256,
        timestamp: u64,
        duration: u64
    }

    // === Method Aliases ===
    public use fun liquidlink_protocol::profile::add_point_by_admin as PointDashBoard.add_point_by_admin;
    public use fun liquidlink_protocol::profile::sub_point_by_admin as PointDashBoard.sub_point_by_admin;
    public use fun liquidlink_protocol::profile::stake_point_by_admin as PointDashBoard.stake_point_by_admin;
    public use fun liquidlink_protocol::profile::unstake_point_by_admin as PointDashBoard.unstake_point_by_admin;

    //  Updater function
    public(package) fun add_point<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        req: AddPointRequest<T>
    ){
        abort 0
    }

    public(package) fun add_point_internal<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        owner: address,
        action: String,
        value: u256
    ){
        abort 0
    }

    public(package) fun sub_point<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        req: SubPointRequest<T>
    ){
        abort 0
    }

    public(package) fun stake_point<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        req: StakePointRequest<T>
    ){
        abort 0
    }

    public(package) fun stake_point_internal<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        owner: address,
        action: String,
        weight: u256,
        timestamp: u64,
        duration: u64
    ){
        abort 0
    } 

    public(package) fun unstake_point<T: drop>(
        dashboard: &mut PointDashBoard<T>,
        req: UnstakePointRequest<T>
    ){
        abort 0
    }

    // ==== VIEW FUNCTION ====
    public fun borrow_owner<T>(
        req: &AddPointRequest<T>
    ): address{
        abort 0
    }

    public fun borrow_amount<T>(
        req: &AddPointRequest<T>
    ): u256{
        abort 0
    }

    public fun borrow_action<T>(
        req: &AddPointRequest<T>
    ): String{
        abort 0
    }

    public fun stake_borrow_owner<T>(
        req: &StakePointRequest<T>
    ): address{
        abort 0
    }

    public fun stake_borrow_action<T>(
        req: &StakePointRequest<T>
    ): String{
        abort 0
    }

    public fun stake_borrow_weight<T>(
        req: &StakePointRequest<T>
    ): u256{
        abort 0
    }

    public fun stake_borrow_duration<T>(
        req: &StakePointRequest<T>
    ): u64{
        abort 0
    }

    public fun stake_borrow_timestamp<T>(
        req: &StakePointRequest<T>
    ): u64{
        abort 0
    }

    // ===== Add Point =====
    public fun send_add_point_req<T: drop>(
        _witness: &T,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }
    
    #[test_only]
    public fun send_add_point_req_with_assigned_updater<T: drop>(
        _witness: &T,
        updater: address,
        owner: address,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun send_add_point_req_with_owner<T: drop>(
        _witness: &T,
        owner: address,
        action: String,
        value: u256,
        ctx: &mut TxContext
    ){
        abort 0
    }

    // ===== Sub Point =====
    /// Use the function carefully as it's possible on-chain point zero out while off-chain calculation ends up in positive
    /// ex: if we have requests with (+1, -3, +2), on-chain: +2; off-chain: 0
    public fun send_sub_point_req<T: drop>(
        _witness: &T,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }

    #[test_only]
    public fun send_sub_point_req_with_assigned_updater<T: drop>(
        _witness: &T,
        updater: address,
        owner: address,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun send_sub_point_req_with_owner<T: drop>(
        _witness: &T,
        owner: address,
        action: String,
        value: u256,
        ctx: &mut TxContext
    ){
        abort 0
    }

    // ===== Stake Point =====
    public fun send_stake_point_req<T: drop>(
        _witness: &T,
        action: String,
        weight: u256,   
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }
    
    #[test_only]
    public fun send_stake_point_req_with_assigned_updater<T: drop>(
        _witness: &T,
        updater: address,
        owner: address,
        action: String,
        weight: u256,   
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun send_stake_point_req_with_owner<T: drop>(
        _witness: &T,
        owner: address,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    // ===== Unstake Point =====
    public fun send_unstake_point_req<T: drop>(
        _witness: &T,
        action: String,
        weight: u256,   
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }
    
    #[test_only]
    public fun send_unstake_point_req_with_assigned_updater<T: drop>(
        _witness: &T,
        updater: address,
        owner: address,
        action: String,
        weight: u256,   
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    public fun send_unstake_point_req_with_owner<T: drop>(
        _witness: &T,
        owner: address,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    // private function
    /// @notice if dashboard doesn't have owner information in `user_infos`, create a empty object and insert it
    fun init_user_info<T: drop>(dashboard: &mut PointDashBoard<T>, owner: address){
        abort 0
    }
    
    fun send_add_point_req_<T: drop>(
        updater: address,
        owner: address,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }

    fun send_sub_point_req_<T: drop>(
        updater: address,
        owner: address,
        action: String,
        value: u256,   
        ctx: &mut TxContext
    ){
        abort 0
    }

    fun send_stake_point_req_<T: drop>(
        updater: address,
        owner: address,
        action: String,
        weight: u256,   
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    fun send_unstake_point_req_<T: drop>(
        updater: address,
        owner: address,
        action: String,
        weight: u256,
        duration: u64,
        clock: &Clock,
        ctx: &mut TxContext
    ){
        abort 0
    }

    fun checkpoint(
        config: &mut Config,
        timestamp: u64,
        weight: u256,
        duration: u64
    ):u256{
        abort 0
    }

    fun calculate_config_points(config: &Config, current_time: u64):u256{
        abort 0
    }
} 